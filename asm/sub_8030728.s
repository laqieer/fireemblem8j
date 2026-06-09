	.syntax unified
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.set sub_801964C, 0x0801964C + 1
	.section .text.sub_8030728, "ax", %progbits
@ sub_8030728 @ JP 0x08030728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030728
	.thumb_func
sub_8030728:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl sub_801964C
	movs r1, #0
	ldr r0, _080307AC @ =0x020228A8
	mov sl, r0
	movs r6, #0x1f
	ldr r3, _080307B0 @ =0x02002ADC
	mov sb, r3
_08030742:
	movs r2, #0
	adds r0, r1, #7
	adds r3, r1, #1
	mov r8, r3
	lsls r0, r0, #4
	mov ip, r0
	lsls r7, r1, #4
_08030750:
	mov r1, ip
	adds r0, r1, r2
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r5, r2, #1
	adds r2, r7, r2
	lsls r2, r2, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r4, r0, r1
	add r2, sb
	movs r1, #7
_08030776:
	adds r3, #2
	cmp r3, #0x1f
	ble _0803077E
	movs r3, #0x1f
_0803077E:
	adds r0, r4, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _08030776
	adds r2, r5, #0
	cmp r2, #0xf
	ble _08030750
	mov r1, r8
	cmp r1, #3
	ble _08030742
	ldr r0, _080307B4 @ =sub_8030664
	bl SetSecondaryHBlankHandler
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080307AC: .4byte 0x020228A8
_080307B0: .4byte 0x02002ADC
_080307B4: .4byte 0x08030665  @ sub_8030664

