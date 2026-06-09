	.syntax unified
	.set memcpy, 0x080D6908 + 1
	.set sub_80BADB0, 0x080BADB0 + 1
	.section .text.sub_80BA9F0, "ax", %progbits
@ sub_80BA9F0 @ JP 0x080BA9F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA9F0
	.thumb_func
sub_80BA9F0:
	push {lr}
	sub sp, #4
	ldr r1, _080BAA24 @ =0x081F5BE8
	mov r0, sp
	movs r2, #4
	bl memcpy
	bl sub_80BADB0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r1, #0
_080BAA08:
	mov r3, sp
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r2, r0
	bge _080BAA1C
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #3
	bls _080BAA08
_080BAA1C:
	adds r0, r1, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080BAA24: .4byte 0x081F5BE8

