	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8061F90, "ax", %progbits
@ sub_8061F90 @ JP 0x08061F90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061F90
	.thumb_func
sub_8061F90:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08061FC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061FCC @ =0x08600B04
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r0, _08061FD0 @ =0x086886B0
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08061FD4 @ =0x08687B14
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061FC8: .4byte 0x0201774C
_08061FCC: .4byte 0x08600B04
_08061FD0: .4byte 0x086886B0
_08061FD4: .4byte 0x08687B14

