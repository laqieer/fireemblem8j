	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set PutNumber, 0x08004A90 + 1
	.set sub_80165F0, 0x080165F0 + 1
	.set sub_80B9DA4, 0x080B9DA4 + 1
	.section .text.sub_80B9CEC, "ax", %progbits
@ sub_80B9CEC @ JP 0x080B9CEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9CEC
	.thumb_func
sub_80B9CEC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	adds r0, r4, #0
	bl sub_80B9DA4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r4, #0
	bne _080B9D0C
	movs r2, #1
	b _080B9D18
_080B9D0C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl IsItemDisplayUsable
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
_080B9D18:
	mov r0, r8
	adds r1, r5, #0
	adds r3, r6, #0
	bl sub_80165F0
	adds r4, r6, #0
	adds r4, #0x22
	bl GetPartyGoldAmount
	movs r1, #1
	cmp r0, r7
	blt _080B9D32
	movs r1, #2
_080B9D32:
	adds r0, r4, #0
	adds r2, r7, #0
	bl PutNumber
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

