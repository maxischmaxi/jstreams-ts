// @generated by protoc-gen-connect-es v1.6.1
// @generated from file tier.proto (package tier, syntax proto3)
/* eslint-disable */
// @ts-nocheck

import { GetTierIconRequest, GetTierIconResponse } from "./tier_pb.js";
import { MethodKind } from "@bufbuild/protobuf";

/**
 * @generated from service tier.TierService
 */
export declare const TierService: {
  readonly typeName: "tier.TierService",
  readonly methods: {
    /**
     * @generated from rpc tier.TierService.GetTierIcon
     */
    readonly getTierIcon: {
      readonly name: "GetTierIcon",
      readonly I: typeof GetTierIconRequest,
      readonly O: typeof GetTierIconResponse,
      readonly kind: MethodKind.Unary,
    },
  }
};
