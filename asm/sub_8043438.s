	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_8043438, "ax", %progbits
@ sub_8043438 @ JP 0x08043438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043438
	.thumb_func
sub_8043438:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	lsls r0, r5, #3
	mov r8, r0
	ldr r6, _080434A0 @ =0x0203DA2C
	adds r0, r0, r6
	mov sb, r0
	bl sub_8003CF8
	mov r0, sb
	movs r1, #0
	bl sub_8003D90
	lsls r4, r5, #2
	adds r4, r4, r5
	lsls r4, r4, #2
	ldr r0, _080434A4 @ =0x0203DB78
	adds r4, r4, r0
	mov r0, sb
	adds r1, r4, #0
	bl sub_8003F28
	subs r6, #0xc
	add r8, r6
	mov r1, r8
	ldrh r0, [r1, #0xc]
	ldr r1, _080434A8 @ =0x00000FFF
	ands r1, r0
	ldrb r2, [r4, #0x10]
	movs r0, #0xf
	ands r0, r2
	lsls r0, r0, #0xc
	orrs r1, r0
	mov r0, r8
	strh r1, [r0, #0xc]
	lsls r5, r5, #7
	ldr r0, _080434AC @ =0x020234BE
	adds r5, r5, r0
	mov r0, sb
	adds r1, r5, #0
	bl PutText
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080434A0: .4byte 0x0203DA2C
_080434A4: .4byte 0x0203DB78
_080434A8: .4byte 0x00000FFF
_080434AC: .4byte 0x020234BE

