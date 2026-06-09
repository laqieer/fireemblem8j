	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80533B8, "ax", %progbits
@ sub_80533B8 @ JP 0x080533B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80533B8
	.thumb_func
sub_80533B8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _08053408
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08053408
	strh r1, [r5, #0x2c]
	ldr r1, [r5, #0x48]
	ldrh r0, [r5, #0x2e]
	adds r0, r0, r1
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _08053454 @ =0x0203E1A8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r2, [r5, #0x48]
	ldrh r1, [r0]
	adds r1, r1, r2
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _08053408
	movs r0, #1
	str r0, [r5, #0x58]
_08053408:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne _08053464
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne _08053464
	ldr r4, _08053458 @ =0x0203E14E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0805345C @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _08053442
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
_08053442:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, _08053460 @ =0x02017750
	str r6, [r0]
	adds r0, r5, #0
	bl sub_8002DE4
	b _08053470
	.align 2, 0
_08053454: .4byte 0x0203E1A8
_08053458: .4byte 0x0203E14E
_0805345C: .4byte 0x02017780
_08053460: .4byte 0x02017750
_08053464:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls _08053470
	movs r0, #0x54
	str r0, [r5, #0x54]
_08053470:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

