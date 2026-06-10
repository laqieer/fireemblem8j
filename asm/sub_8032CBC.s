	.syntax unified
	.section .text.sub_8032CBC, "ax", %progbits
@ sub_8032CBC @ JP 0x08032CBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032CBC
	.thumb_func
sub_8032CBC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08032D1C @ =0x085C6080
	ldr r0, [r0]
	adds r0, #0x2c
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	ble _08032D34
	movs r0, #0xff
	lsls r0, r0, #0x18
	mov ip, r0
_08032CD6:
	subs r1, r4, #1
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	mov r8, r1
	cmp r3, #0
	blt _08032D2A
	ldr r0, _08032D1C @ =0x085C6080
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r4
	movs r6, #0
	ldrsb r6, [r0, r6]
	adds r2, r1, #0
	adds r2, #0x41
	lsls r0, r3, #0x18
	mov r7, ip
	adds r5, r0, r7
	adds r0, r3, #0
	adds r0, #0x2d
	adds r3, r0, r1
	adds r2, r2, r4
_08032D02:
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r6, r0
	bne _08032D20
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	cmp r1, r0
	bne _08032D20
	movs r0, #0
	b _08032D36
	.align 2, 0
_08032D1C: .4byte 0x085C6080
_08032D20:
	adds r0, r5, #0
	add r5, ip
	subs r3, #1
	cmp r0, #0
	bge _08032D02
_08032D2A:
	mov r1, r8
	lsls r0, r1, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bgt _08032CD6
_08032D34:
	movs r0, #1
_08032D36:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

