	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_805082C, 0x0805082C + 1
	.section .text.sub_80297F4, "ax", %progbits
@ sub_80297F4 @ JP 0x080297F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80297F4
	.thumb_func
sub_80297F4:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_805082C
	ldr r1, _08029814 @ =0x0203A954
	ldrb r0, [r4, #2]
	strb r0, [r1, #0xd]
	ldr r0, _08029818 @ =0x085C3E98
	movs r1, #3
	bl sub_8002BCC
	movs r0, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08029814: .4byte 0x0203A954
_08029818: .4byte 0x085C3E98

