import { Router, Response, Request } from "express";
import { JobPostEntity } from "../database/entities/jobpost.entity";
import { JobPostDto } from "../dtos/JobPostDto";
import { JobPostService } from "../services/jobpost.service"; // import service

export class JobPostController {
  public router: Router;
  private postService: JobPostService;

  constructor() {
    this.postService = new JobPostService(); // Create a new instance of PostController
    this.router = Router();
    this.routes();
  }

  public getAll = async (req: Request, res: Response) => {
    try {
      const posts = await this.postService.getAll();
      res.send(posts).json();
    } catch (error: any) {
      console.log("Error ===> ", error);
      res.status(500).send({ status: 500, message: "Internal server error" });
    }
  };

  public getOne = async (req: Request, res: Response) => {
    let { id } = req.params;
    const jobPostId = Number.parseInt(id as string);

    if (isNaN(jobPostId) || !jobPostId) {
      res
        .status(400)
        .send({ status: 400, message: "Invalid job post id provided !" });
      return;
    }
    const posts = await this.postService.getOne(jobPostId);

    if (!posts) {
      res
        .status(404)
        .send({ status: 404, message: `Job post ${jobPostId} not found !` });
      return;
    }
    res.send(posts).json();
  };

  public create = async (req: Request, res: Response) => {
    const post = req["body"] as JobPostDto;
    try {
      const newPost = await this.postService.create(post);
      res.send(newPost);
    } catch (error: any) {
      res.status(400).send({ status: 400, message: error });
      return;
    }
  };

  public update = async (req: Request, res: Response) => {
    const post = req["body"] as JobPostDto;
    const id = post.id;

    if (!id || isNaN(Number(id))) {
      res.status(400).send({ status: 400, message: `Invalide id provided !` });
      return;
    }
    try {
      res.send(await this.postService.update(post, Number(id)));
    } catch (error: any) {
      res.status(400).send({ status: 400, message: error });
      return;
    }
  };

  public delete = async (req: Request, res: Response) => {
    const id = req["params"]["id"];
    try {
      const response = await this.postService.delete(Number(id));
      res.send(response);
    } catch (error: any) {
      res.status(400).send({ status: 400, message: error.message });
      return;
    }
  };

  /**
   * Configure the routes of controller
   */
  public routes() {
    this.router.get("/", this.getAll);
    this.router.get("/:id", this.getOne);
    this.router.post("/", this.create);
    this.router.put("/", this.update);
    this.router.delete("/:id", this.delete);
  }
}
