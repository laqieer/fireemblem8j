	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B1474, "ax", %progbits
@ sub_80B1474 @ JP 0x080B1474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1474
	.thumb_func
sub_80B1474:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _080B14D8 @ =0x08A9DAB4
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080B14CE
	adds r1, r4, #0
	adds r1, #0x3c
	adds r1, r1, r5
	movs r3, #1
	movs r0, #1
	strb r0, [r1]
	lsls r2, r5, #1
	adds r0, r4, #0
	adds r0, #0x40
	adds r0, r0, r2
	strh r7, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	adds r0, r0, r2
	mov r2, r8
	strh r2, [r0]
	adds r0, r6, #0
	orrs r0, r3
	strb r0, [r1]
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _080B14CE
	ldr r0, _080B14DC @ =0x085C72D0
	ldr r1, _080B14E0 @ =0x060100C0
	bl sub_8013008
	ldr r0, _080B14E4 @ =0x085C730C
	ldr r1, _080B14E8 @ =0x060104C0
	bl sub_8013008
_080B14CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B14D8: .4byte 0x08A9DAB4
_080B14DC: .4byte 0x085C72D0
_080B14E0: .4byte 0x060100C0
_080B14E4: .4byte 0x085C730C
_080B14E8: .4byte 0x060104C0

