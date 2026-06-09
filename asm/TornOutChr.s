	.syntax unified
	.section .text.TornOutChr, "ax", %progbits
@ TornOutChr @ JP 0x080280F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TornOutChr
	.thumb_func
TornOutChr:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r5, r1, #0
	mov sb, r2
	ldr r0, _08028158 @ =0x085C3C1C
	lsls r3, r3, #1
	adds r3, r3, r0
	ldrh r6, [r3]
	movs r3, #0
	cmp r3, sb
	bge _0802814C
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	movs r1, #0xf
	mov ip, r1
	mov r7, ip
	lsls r7, r0
	mov ip, r7
_08028120:
	adds r4, r3, #1
	cmp r5, #0
	ble _08028146
	mov r0, ip
	mvns r2, r0
	asrs r1, r6, #3
	lsls r1, r1, #2
	lsls r0, r3, #0xa
	adds r3, r5, #0
	adds r0, r0, r1
	mov r7, r8
	adds r1, r7, r0
_08028138:
	ldr r0, [r1]
	ands r0, r2
	str r0, [r1]
	adds r1, #0x20
	subs r3, #1
	cmp r3, #0
	bne _08028138
_08028146:
	adds r3, r4, #0
	cmp r3, sb
	blt _08028120
_0802814C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028158: .4byte 0x085C3C1C

