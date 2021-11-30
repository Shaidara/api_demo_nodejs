import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity({ name: "job_post" })
export class JobPostEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  title!: string;

  @Column()
  description!: string;

  @Column()
  location!: string;

  @Column({ name: "by_user" })
  byUser!: string;

  @Column({ name: "hourly_rate" })
  hourlyRate!: number;

  @Column({ name: "created_on" })
  createdOn!: Date;

  @Column({ name: "last_update" })
  lastUpdate!: Date;
}
