import { getConnection } from "typeorm";
import { JobPostEntity } from "../database/entities/jobpost.entity";
import { JobPostDto } from "../dtos/JobPostDto";
import { valideForInsert } from "../helpers/validation";
import { Mapper } from "../mapper/mapper";
import { JobPostRepository } from "./../repository/jobpost.repository";

export class JobPostService {
  private jobPostRepository: JobPostRepository;
  private mapper: Mapper;

  constructor() {
    const connection = getConnection("job_post_db_connection");

    this.jobPostRepository = connection.getCustomRepository(JobPostRepository);
    this.mapper = new Mapper();
  }

  public getAll = async () => {
    const posts = await this.jobPostRepository.find();
    return posts;
  };

  public getOne = async (id: number) => {
    const posts = await this.jobPostRepository.findOne({ id });
    return posts;
  };

  public create = async (postDto: JobPostDto) => {
    const entity = this.valideJobPost(postDto);

    const newPost = await this.jobPostRepository.save(entity);

    return this.mapper.mapToDto(newPost);
  };

  public update = async (postDto: JobPostDto, id: number) => {
    const find = await this.getOne(id);

    // if job post does not exist, we throw an error
    if (!find || find === undefined || find === null) {
      throw new Error(`Invalid job post provided : ${id}`);
    }

    const entity = this.valideJobPost(postDto);
    entity.lastUpdate = new Date(Date.now());
    entity.createdOn = find.createdOn;

    await this.jobPostRepository.update(id, entity);

    return this.mapper.mapToDto((await this.getOne(id)) as JobPostEntity);
  };

  public delete = async (id: number) => {
    const find = await this.getOne(id);

    // if job post does not exist, we throw an error
    if (!find || find === null) {
      throw new Error(`Invalid job post provided : ${id}`);
    }

    const deletedPost = await this.jobPostRepository.delete(id);
    return { message: `Job post ${id} successfully deleted !` };
  };

  /**
   * Validate Job post mandatory property and values
   * @param jobPostDto Job post to validate
   * @returns the mapped dto if no error found otherwise return a list of errors
   */
  private valideJobPost = (jobPostDto: JobPostDto) => {
    const validationErrors = valideForInsert(jobPostDto);

    if (validationErrors.length > 0) {
      throw { validationErrors };
    }

    return this.mapper.mapToEntity(jobPostDto);
  };
}
