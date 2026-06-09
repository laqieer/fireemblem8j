	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8041D0C, "ax", %progbits
@ sub_8041D0C @ JP 0x08041D0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041D0C
	.thumb_func
sub_8041D0C:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r2, r0, #0
	mov r1, sp
	ldr r0, _08041D3C @ =0x080DD3F0
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08041D40 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08041D34
	lsls r0, r2, #2
	add r0, sp
	ldrh r0, [r0]
	bl m4aSongNumStart
_08041D34:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08041D3C: .4byte 0x080DD3F0
_08041D40: .4byte 0x0202BCEC

