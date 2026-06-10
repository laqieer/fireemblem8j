	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_803082C, "ax", %progbits
@ sub_803082C @ JP 0x0803082C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803082C
	.thumb_func
sub_803082C:
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803088C @ =0x02022988
	ldr r1, _08030890 @ =0x050000E0
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_80D636C
	movs r5, #0xc
	subs r4, #0xe0
	mov ip, r4
	movs r6, #0x1f
	ldr r7, _08030894 @ =0x02002ADC
_08030844:
	adds r0, r5, #0
	adds r0, #0x90
	lsls r0, r0, #1
	add r0, ip
	ldrh r0, [r0]
	adds r3, r0, #0
	ands r3, r6
	asrs r1, r0, #5
	ands r1, r6
	asrs r0, r0, #0xa
	ands r0, r6
	adds r2, r5, #0
	adds r2, #0x20
	adds r4, r5, #1
	lsls r0, r0, #0xa
	lsls r1, r1, #5
	adds r5, r0, r1
	lsls r2, r2, #1
	adds r2, r2, r7
	movs r1, #7
_0803086C:
	adds r3, #2
	cmp r3, #0x1f
	ble _08030874
	movs r3, #0x1f
_08030874:
	adds r0, r5, r3
	strh r0, [r2]
	adds r2, #0x80
	subs r1, #1
	cmp r1, #0
	bge _0803086C
	adds r5, r4, #0
	cmp r5, #0xf
	ble _08030844
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803088C: .4byte 0x02022988
_08030890: .4byte 0x050000E0
_08030894: .4byte 0x02002ADC

