	.syntax unified
	.set sub_8003AFC, 0x08003AFC + 1
	.set sub_80D6A4C, 0x080D6A4C + 1
	.section .text.sub_8003B90, "ax", %progbits
@ sub_8003B90 @ JP 0x08003B90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003B90
	.thumb_func
sub_8003B90:
	push {r2, r3}
	push {r4, r5, lr}
	sub sp, #0x100
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, [sp, #0x10c]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add r2, sp, #0x110
	mov r0, sp
	bl sub_80D6A4C
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sp
	bl sub_8003AFC
	add sp, #0x100
	pop {r4, r5}
	pop {r3}
	add sp, #8
	bx r3

