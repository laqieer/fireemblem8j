	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A7704, "ax", %progbits
@ sub_80A7704 @ JP 0x080A7704 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7704
	.thumb_func
sub_80A7704:
	push {r4, r5, r6, lr}
	sub sp, #0x40
	movs r1, #1
	rsbs r1, r1, #0
	add r0, sp, #0x3c
_080A770E:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080A770E
	movs r4, #0
	ldr r6, _080A7738 @ =0x08A9CA20
	ldr r5, _080A773C @ =0x000001FF
_080A771C:
	lsls r0, r4, #6
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x40
	bl WriteAndVerifySramFast
	adds r4, #1
	cmp r4, r5
	ble _080A771C
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7738: .4byte 0x08A9CA20
_080A773C: .4byte 0x000001FF

