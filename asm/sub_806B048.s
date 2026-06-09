	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.section .text.sub_806B048, "ax", %progbits
@ sub_806B048 @ JP 0x0806B048 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B048
	.thumb_func
sub_806B048:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0x10
	bl sub_8012E84
	adds r3, r0, #0
	ldr r0, _0806B098 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	bl sub_80737A4
	bl sub_8001EE4
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x11
	bne _0806B090
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r1, _0806B09C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806B090:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B098: .4byte 0x020228A8
_0806B09C: .4byte 0x0201774C

