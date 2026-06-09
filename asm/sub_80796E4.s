	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80796E4, "ax", %progbits
@ sub_80796E4 @ JP 0x080796E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80796E4
	.thumb_func
sub_80796E4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08079704 @ =0x08848A50
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079704: .4byte 0x08848A50

