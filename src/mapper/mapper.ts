import { JobPostEntity } from "../database/entities/jobpost.entity";
import { JobPostDto } from "../dtos/JobPostDto";

export class Mapper {
  mapToEntity(dto: JobPostDto): JobPostEntity {
    return {
      id: dto.id,
      title: dto.title,
      description: dto.description,
      location: dto.location,
      byUser: dto.byUser,
      hourlyRate: dto.hourlyRate,
      createdOn: dto.createdOn as Date,
      lastUpdate: dto.lastUpdate as Date,
    };
  }

  mapToDto(entity: JobPostEntity): JobPostDto {
    return new JobPostDto(
      entity.id,
      entity.title,
      entity.description,
      entity.location,
      entity.hourlyRate,
      entity.byUser,
      entity.createdOn as any,
      entity.lastUpdate as any
    );
  }
}
