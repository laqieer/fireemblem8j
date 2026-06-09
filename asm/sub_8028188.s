	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitSupporterCharacter, 0x08028170 + 1
	.section .text.sub_8028188, "ax", %progbits
@ sub_8028188 @ JP 0x08028188 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028188
	.thumb_func
sub_8028188:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r5, r0, #1
	adds r6, r0, #0
	adds r6, #0x40
	cmp r5, r6
	bge _080281C8
_080281A6:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080281C2
	ldr r0, [r4]
	cmp r0, #0
	beq _080281C2
	ldrb r0, [r0, #4]
	cmp r0, r7
	bne _080281C2
	adds r0, r4, #0
	b _080281CA
_080281C2:
	adds r5, #1
	cmp r5, r6
	blt _080281A6
_080281C8:
	movs r0, #0
_080281CA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

