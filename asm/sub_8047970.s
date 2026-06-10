	.syntax unified
	.section .text.sub_8047970, "ax", %progbits
@ sub_8047970 @ JP 0x08047970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047970
	.thumb_func
sub_8047970:
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r2, r0, #0
	adds r3, r1, #0
	mov r0, sp
	ldr r1, _080479A4 @ =0x080DEE88
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldm r1!, {r4, r5, r6}
	stm r0!, {r4, r5, r6}
	ldr r1, [r1]
	str r1, [r0]
	cmp r3, #0
	bne _080479A8
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080479BC
	movs r0, #0xd8
	lsls r0, r0, #3
	b _080479C8
	.align 2, 0
_080479A4: .4byte 0x080DEE88
_080479A8:
	adds r0, r2, #0
	adds r0, #0x58
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080479BC
	movs r0, #1
	rsbs r0, r0, #0
	b _080479C8
_080479BC:
	ldr r0, [r2, #0x48]
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
_080479C8:
	add sp, #0x28
	pop {r4, r5, r6}
	pop {r1}
	bx r1

