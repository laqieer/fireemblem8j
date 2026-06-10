	.syntax unified
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80346DC, "ax", %progbits
@ sub_80346DC @ JP 0x080346DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80346DC
	.thumb_func
sub_80346DC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	bl sub_8003E0C
	cmp r0, #0x27
	bgt _08034702
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #4
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x18
	b _08034710
_08034702:
	adds r2, r4, #0
	adds r2, #0x62
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x63
	movs r0, #0x10
_08034710:
	strb r0, [r1]
	ldr r0, [r4, #0x2c]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	bne _08034722
	ldrb r0, [r1]
	adds r0, #6
	b _08034730
_08034722:
	cmp r0, #0x3b
	bne _08034732
	ldrb r0, [r2]
	subs r0, #3
	strb r0, [r2]
	ldrb r0, [r1]
	adds r0, #3
_08034730:
	strb r0, [r1]
_08034732:
	ldrb r0, [r2]
	adds r0, #8
	strb r0, [r2]
	ldrb r0, [r1]
	subs r0, #0x10
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0

