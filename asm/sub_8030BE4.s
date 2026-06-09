	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_8030BE4, "ax", %progbits
@ sub_8030BE4 @ JP 0x08030BE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030BE4
	.thumb_func
sub_8030BE4:
	push {lr}
	sub sp, #4
	ldr r1, _08030C08 @ =0x080DCC8C
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _08030C0C @ =0x0202BCEC
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_08030C08: .4byte 0x080DCC8C
_08030C0C: .4byte 0x0202BCEC

