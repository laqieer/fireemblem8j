	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C8348, "ax", %progbits
@ sub_80C8348 @ JP 0x080C8348 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8348
	.thumb_func
sub_80C8348:
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	ldr r5, _080C8374 @ =0x06014000
	movs r4, #3
_080C8352:
	str r6, [sp]
	mov r0, sp
	adds r1, r5, #0
	ldr r2, _080C8378 @ =0x010000D8
	bl sub_80D636C
	movs r0, #0x80
	lsls r0, r0, #3
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _080C8352
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C8374: .4byte 0x06014000
_080C8378: .4byte 0x010000D8

