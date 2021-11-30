import express, { Request, Response } from "express";
import { JobPostController } from "./controller/jobpost.controller";
import { createConnection } from "typeorm";
import dotenv from "dotenv";
import * as path from "path";

export default class Server {
  private jobPostController!: JobPostController;
  private app: express.Application;

  constructor() {
    dotenv.config();
    this.app = express(); // init the application
    this.configuration();
    this.routes();
  }

  /**
   * Method to configure the server,
   * If we didn't configure the port into the environment
   * variables it takes the default port 3000
   */
  public configuration() {
    this.app.use(express.json());
  }

  /**
   * Method to configure the routes
   */
  public async routes() {
    const port = Number.parseInt(process.env.DB_PORT as string);
    const host = process.env.DB_HOST;
    const username = process.env.DB_USER;
    const password = process.env.DB_PASSWORD;
    const database = process.env.DB_NAME;
    const entityPath = path.join(__dirname, "database/entities/**/*.entity.ts");

    await createConnection({
      type: "postgres",
      host,
      port,
      username,
      password,
      database,
      entities: [entityPath],
      synchronize: false,
      name: "job_post_db_connection",
    });

    this.bindRoutes();
  }

  private bindRoutes() {
    this.app.get("/", (req: Request, res: Response) => {
      res.send("Welcome to the job post API !");
    });

    this.jobPostController = new JobPostController();

    this.app.use(`/api/job-post/`, this.jobPostController.router); // Configure the new routes of the controller job post
  }

  public getApp() {
    return this.app;
  }
  /**
   * Used to start the server
   */
  public start() {
    this.app.set("port", process.env.APP_PORT || 3001);
    this.app.listen(this.app.get("port"), () => {
      console.log(
        `Server is listening http://localhost:${this.app.get("port")} port.`
      );
    });
  }
}

//const server = new Server(); // Create server instance
//server.start(); // Execute the server
