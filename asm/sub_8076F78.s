	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_8076F78, "ax", %progbits
@ sub_8076F78 @ JP 0x08076F78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076F78
	.thumb_func
sub_8076F78:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08076FC4 @ =0x08A1CC54
	ldrh r0, [r5, #0x2e]
	adds r4, r0, #1
	strh r4, [r5, #0x2e]
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _08076FBE
	lsls r4, r4, #0x10
	asrs r4, r4, #0x12
	movs r0, #0xf
	ands r4, r0
	lsls r4, r4, #1
	adds r4, r4, r1
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x10
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl sub_8000D68
	adds r4, #0x40
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r1, #0x11
	lsls r1, r1, #5
	adds r1, #0x12
	adds r0, r4, #0
	movs r2, #0xe
	bl sub_8000D68
_08076FBE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08076FC4: .4byte 0x08A1CC54

