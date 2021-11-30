interface IJobPostDto {
  id: number;
  title: string;
  description: string;
  location: string;
  byUser: string;
  hourlyRate: number;
  createdOn: Date | undefined;
  lastUpdate: Date | undefined;
}

export class JobPostDto implements IJobPostDto {
  constructor(
    id: number,
    title: string,
    description: string,
    location: string,
    hourlyRate: number,
    byUser: string,
    createdOn = undefined,
    lastUpdate = undefined
  ) {
    this.id = id;
    this.title = title;
    this.description = description;
    this.location = location;
    this.hourlyRate = hourlyRate;
    this.byUser = byUser;
    this.createdOn = createdOn;
    this.lastUpdate = lastUpdate;
  }

  id: number;
  title: string;
  description: string;
  location: string;
  hourlyRate: number;
  byUser: string;
  createdOn: Date | undefined;
  lastUpdate: Date | undefined;
}
