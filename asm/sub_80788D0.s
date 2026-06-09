	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80788D0, "ax", %progbits
@ sub_80788D0 @ JP 0x080788D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80788D0
	.thumb_func
sub_80788D0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r6, r0]
	movs r1, #0x2e
	ldrsh r0, [r6, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	adds r5, r0, #0
	ldr r0, _0807892C @ =0x020165C8
	ldr r4, _08078930 @ =0x020228A8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	adds r3, r5, #0
	bl sub_80737A4
	bl sub_8001EE4
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r6, r2]
	adds r0, #1
	cmp r1, r0
	bne _08078924
	adds r0, r6, #0
	bl sub_8002DE4
_08078924:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807892C: .4byte 0x020165C8
_08078930: .4byte 0x020228A8

