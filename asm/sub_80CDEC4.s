	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CDEC4, "ax", %progbits
@ sub_80CDEC4 @ JP 0x080CDEC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CDEC4
	.thumb_func
sub_80CDEC4:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0x12
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CDEF8
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CDF0A
_080CDEF8:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CDF0A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CDF5C
	cmp r0, #2
	bgt _080CDF20
	cmp r0, #1
	beq _080CDF2A
	b _080CDFE0
_080CDF20:
	cmp r0, #3
	beq _080CDF90
	cmp r0, #4
	beq _080CDFC4
	b _080CDFE0
_080CDF2A:
	ldr r0, _080CDF48 @ =0x08B7743C
	ldr r1, _080CDF4C @ =0x06010000
	bl sub_8013008
	ldr r0, _080CDF50 @ =0x08B77E44
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDF54 @ =0x08B77A48
	ldr r1, _080CDF58 @ =0x06010F00
	bl sub_8013008
	b _080CDFE0
	.align 2, 0
_080CDF48: .4byte 0x08B7743C
_080CDF4C: .4byte 0x06010000
_080CDF50: .4byte 0x08B77E44
_080CDF54: .4byte 0x08B77A48
_080CDF58: .4byte 0x06010F00
_080CDF5C:
	ldr r0, _080CDF7C @ =0x08B788BC
	ldr r1, _080CDF80 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CDF84 @ =0x08B793D0
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDF88 @ =0x08B78F54
	ldr r1, _080CDF8C @ =0x06012D00
	bl sub_8013008
	b _080CDFE0
	.align 2, 0
_080CDF7C: .4byte 0x08B788BC
_080CDF80: .4byte 0x06011E00
_080CDF84: .4byte 0x08B793D0
_080CDF88: .4byte 0x08B78F54
_080CDF8C: .4byte 0x06012D00
_080CDF90:
	ldr r0, _080CDFB0 @ =0x08B77E64
	ldr r1, _080CDFB4 @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CDFB8 @ =0x08B7889C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDFBC @ =0x08B784E4
	ldr r1, _080CDFC0 @ =0x06014B00
	bl sub_8013008
	b _080CDFE0
	.align 2, 0
_080CDFB0: .4byte 0x08B77E64
_080CDFB4: .4byte 0x06013C00
_080CDFB8: .4byte 0x08B7889C
_080CDFBC: .4byte 0x08B784E4
_080CDFC0: .4byte 0x06014B00
_080CDFC4:
	ldr r0, _080CDFF4 @ =0x08B793F0
	ldr r1, _080CDFF8 @ =0x06015A00
	bl sub_8013008
	ldr r0, _080CDFFC @ =0x08B79E9C
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE000 @ =0x08B79AAC
	ldr r1, _080CE004 @ =0x06016900
	bl sub_8013008
_080CDFE0:
	ldrh r0, [r4, #0x2a]
	cmp r0, #7
	bne _080CE008
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE00C
	.align 2, 0
_080CDFF4: .4byte 0x08B793F0
_080CDFF8: .4byte 0x06015A00
_080CDFFC: .4byte 0x08B79E9C
_080CE000: .4byte 0x08B79AAC
_080CE004: .4byte 0x06016900
_080CE008:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE00C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

