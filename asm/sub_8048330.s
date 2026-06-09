	.syntax unified
	.set nullsub_13, 0x08008F28 + 1
	.set sub_80088FC, 0x080088FC + 1
	.set sub_8042678, 0x08042678 + 1
	.section .text.sub_8048330, "ax", %progbits
@ sub_8048330 @ JP 0x08048330 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8048330
	.thumb_func
sub_8048330:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_80088FC
	cmp r0, #1
	bne _08048348
	ldr r1, _08048344 @ =0x0203DD88
	movs r0, #0
	b _0804834C
	.align 2, 0
_08048344: .4byte 0x0203DD88
_08048348:
	ldr r1, _08048374 @ =0x0203DD88
	movs r0, #1
_0804834C:
	str r0, [r1]
	adds r4, r1, #0
	mov r0, sp
	ldr r1, [r4]
	strb r1, [r0]
	movs r1, #4
	bl sub_8042678
	ldr r0, [r4]
	cmp r0, #0
	beq _0804836A
	adds r0, r5, #0
	movs r1, #5
	bl nullsub_13
_0804836A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08048374: .4byte 0x0203DD88

