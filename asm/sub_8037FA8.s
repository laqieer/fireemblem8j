	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8037FA8, "ax", %progbits
@ sub_8037FA8 @ JP 0x08037FA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037FA8
	.thumb_func
sub_8037FA8:
	push {r4, lr}
	ldr r0, [r0, #4]
	lsls r0, r0, #0xd
	lsrs r4, r0, #0xe
	bl sub_8000CD8
	ldr r1, _08037FD4 @ =0x0202BCEC
	ldr r1, [r1, #4]
	subs r0, r0, r1
	movs r1, #0x3c
	bl sub_80D6374
	adds r4, r4, r0
	ldr r0, _08037FD8 @ =0x00034BC0
	cmp r4, r0
	ble _08037FCA
	adds r4, r0, #0
_08037FCA:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08037FD4: .4byte 0x0202BCEC
_08037FD8: .4byte 0x00034BC0

