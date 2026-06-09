	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80ACEB4, "ax", %progbits
@ sub_80ACEB4 @ JP 0x080ACEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACEB4
	.thumb_func
sub_80ACEB4:
	push {lr}
	sub sp, #0x10
	ldr r1, _080ACEE8 @ =0x081F578F
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	bl sub_8000CD8
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	add r0, sp
	ldrb r1, [r0]
	ldr r0, _080ACEEC @ =0x0200050C
	lsls r1, r1, #5
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_080ACEE8: .4byte 0x081F578F
_080ACEEC: .4byte 0x0200050C

