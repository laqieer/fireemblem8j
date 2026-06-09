	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8042D6C, 0x08042D6C + 1
	.section .text.sub_804550C, "ax", %progbits
@ sub_804550C @ JP 0x0804550C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804550C
	.thumb_func
sub_804550C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	adds r0, #0x40
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _08045560 @ =0x02000C60
	bl SetTextFont
	movs r5, #0
	cmp r5, sb
	bge _0804559A
	mov sl, r5
	movs r0, #0x98
	mov r8, r0
	movs r7, #0
	movs r6, #0
_08045536:
	ldr r0, _08045564 @ =0x0203DAC1
	adds r4, r6, r0
	adds r0, r4, #0
	bl sub_8003E0C
	adds r1, r0, #0
	movs r0, #0x48
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r1, r0, #1
	cmp r5, #2
	bgt _0804556C
	adds r1, r7, r1
	ldr r0, _08045568 @ =0x0203DB10
	movs r2, #0
	adds r3, r4, #0
	bl sub_80043B8
	b _08045576
	.align 2, 0
_08045560: .4byte 0x02000C60
_08045564: .4byte 0x0203DAC1
_08045568: .4byte 0x0203DB10
_0804556C:
	ldr r0, _080455AC @ =0x0203DB18
	movs r2, #0
	adds r3, r4, #0
	bl sub_80043B8
_08045576:
	ldr r0, [sp]
	adds r0, #0x48
	add r0, sl
	ldr r3, [r0]
	ldr r0, _080455AC @ =0x0203DB18
	mov r1, r8
	movs r2, #2
	bl sub_8042D6C
	movs r0, #8
	add sl, r0
	movs r0, #0x20
	add r8, r0
	adds r7, #0x48
	adds r6, #0xf
	adds r5, #1
	cmp r5, sb
	blt _08045536
_0804559A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080455AC: .4byte 0x0203DB18

