import { JobPostDto } from "../dtos/JobPostDto";
import { IBodyMessageError } from "../error-handler/ErrorMessage";
import stringIsNullOrWhiteSpace from "./helpers";

export const valideForInsert = (dto: JobPostDto): IBodyMessageError[] => {
  let errorMessages: IBodyMessageError[] = [];
  if (stringIsNullOrWhiteSpace(dto.title)) {
    errorMessages.push(buildEmptyMessage("title"));
  }
  if (!stringIsNullOrWhiteSpace(dto.title) && dto.title.length > 50) {
    errorMessages.push(buildMaxCharMessage("title", 50));
  }
  if (stringIsNullOrWhiteSpace(dto.description)) {
    errorMessages.push(buildEmptyMessage("description"));
  }

  if (stringIsNullOrWhiteSpace(dto.location)) {
    errorMessages.push(buildEmptyMessage("location"));
  }
  if (!stringIsNullOrWhiteSpace(dto.location) && dto.location.length > 150) {
    errorMessages.push(buildMaxCharMessage("location", 150));
  }
  if (stringIsNullOrWhiteSpace(dto.byUser)) {
    errorMessages.push(buildEmptyMessage("byUser"));
  }
  if (!stringIsNullOrWhiteSpace(dto.byUser) && dto.byUser.length > 255) {
    errorMessages.push(buildMaxCharMessage("byUser", 255));
  }
  if (!dto.hourlyRate || dto.hourlyRate <= 0 || dto.hourlyRate > 9999.99) {
    errorMessages.push({
      message: "The hourly rate must be grater than 0 and less than 9999.99 !",
      param: "hourlyRate",
    });
  }

  return errorMessages;
};

const buildEmptyMessage = (param: string): IBodyMessageError => {
  return {
    message: `${param} can not be null or empty !`,
    param,
  };
};

const buildMaxCharMessage = (
  param: string,
  length: number
): IBodyMessageError => {
  return {
    message: `${param} must have ${length} characters or less !`,
    param,
  };
};
