import { EntityRepository, Repository } from "typeorm";
import { JobPostEntity } from "../database/entities/jobpost.entity";

@EntityRepository(JobPostEntity)
export class JobPostRepository extends Repository<JobPostEntity> {}
