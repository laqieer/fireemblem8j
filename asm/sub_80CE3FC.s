	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE3FC, "ax", %progbits
@ sub_80CE3FC @ JP 0x080CE3FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE3FC
	.thumb_func
sub_80CE3FC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #8
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE430
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE442
_080CE430:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE442:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE494
	cmp r0, #2
	bgt _080CE458
	cmp r0, #1
	beq _080CE462
	b _080CE518
_080CE458:
	cmp r0, #3
	beq _080CE4C8
	cmp r0, #4
	beq _080CE4FC
	b _080CE518
_080CE462:
	ldr r0, _080CE480 @ =0x08B803D4
	ldr r1, _080CE484 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE488 @ =0x08B80C90
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE48C @ =0x08B80970
	ldr r1, _080CE490 @ =0x06010F00
	bl sub_8013008
	b _080CE518
	.align 2, 0
_080CE480: .4byte 0x08B803D4
_080CE484: .4byte 0x06010000
_080CE488: .4byte 0x08B80C90
_080CE48C: .4byte 0x08B80970
_080CE490: .4byte 0x06010F00
_080CE494:
	ldr r0, _080CE4B4 @ =0x08B81EA4
	ldr r1, _080CE4B8 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE4BC @ =0x08B8274C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE4C0 @ =0x08B82480
	ldr r1, _080CE4C4 @ =0x06012D00
	bl sub_8013008
	b _080CE518
	.align 2, 0
_080CE4B4: .4byte 0x08B81EA4
_080CE4B8: .4byte 0x06011E00
_080CE4BC: .4byte 0x08B8274C
_080CE4C0: .4byte 0x08B82480
_080CE4C4: .4byte 0x06012D00
_080CE4C8:
	ldr r0, _080CE4E8 @ =0x08B80CB0
	ldr r1, _080CE4EC @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE4F0 @ =0x08B815F4
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE4F4 @ =0x08B81278
	ldr r1, _080CE4F8 @ =0x06014B00
	bl sub_8013008
	b _080CE518
	.align 2, 0
_080CE4E8: .4byte 0x08B80CB0
_080CE4EC: .4byte 0x06013C00
_080CE4F0: .4byte 0x08B815F4
_080CE4F4: .4byte 0x08B81278
_080CE4F8: .4byte 0x06014B00
_080CE4FC:
	ldr r0, _080CE52C @ =0x08B81614
	ldr r1, _080CE530 @ =0x06015A00
	bl sub_8013008
	ldr r0, _080CE534 @ =0x08B81E84
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE538 @ =0x08B81B64
	ldr r1, _080CE53C @ =0x06016900
	bl sub_8013008
_080CE518:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xc
	bne _080CE540
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE544
	.align 2, 0
_080CE52C: .4byte 0x08B81614
_080CE530: .4byte 0x06015A00
_080CE534: .4byte 0x08B81E84
_080CE538: .4byte 0x08B81B64
_080CE53C: .4byte 0x06016900
_080CE540:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE544:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

