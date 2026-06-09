	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8073B80, 0x08073B80 + 1
	.section .text.sub_8057150, "ax", %progbits
@ sub_8057150 @ JP 0x08057150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057150
	.thumb_func
sub_8057150:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08057174 @ =0x0203E0FA
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805716C
	bl GetBanimDragonStatusType
	cmp r0, #1
	blo _08057178
	cmp r0, #2
	bhi _08057178
_0805716C:
	adds r0, r4, #0
	bl sub_8002DE4
	b _080571A6
	.align 2, 0
_08057174: .4byte 0x0203E0FA
_08057178:
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #4
	bl sub_8012E84
	bl sub_8073B80
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #9
	bne _080571A6
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_080571A6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

