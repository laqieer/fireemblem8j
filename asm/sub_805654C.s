	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.section .text.sub_805654C, "ax", %progbits
@ sub_805654C @ JP 0x0805654C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805654C
	.thumb_func
sub_805654C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r5, r3, #0
	ldr r0, _08056570 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056578
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056574
	adds r0, r7, #0
	b _08056588
	.align 2, 0
_08056570: .4byte 0x0203E11C
_08056574:
	adds r0, r6, #0
	b _08056588
_08056578:
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056586
	adds r0, r5, #0
	b _08056588
_08056586:
	ldr r0, [sp, #0x14]
_08056588:
	movs r1, #0x14
	bl AnimCreate
	adds r1, r0, #0
	movs r0, #0xa1
	lsls r0, r0, #6
	strh r0, [r1, #8]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

