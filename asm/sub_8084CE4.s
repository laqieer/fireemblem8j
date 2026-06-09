	.syntax unified
	.section .text.sub_8084CE4, "ax", %progbits
@ sub_8084CE4 @ JP 0x08084CE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084CE4
	.thumb_func
sub_8084CE4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	lsls r4, r4, #0x10
	asrs r7, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	adds r6, #2
	movs r2, #1
	ldr r0, _08084D58 @ =0x080DC15C
	mov sb, r0
	adds r4, r3, r1
	lsls r3, r3, #1
_08084D1C:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #1
	add r0, sb
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r1, r8
	muls r1, r0, r1
	subs r0, r2, r7
	cmp r0, #0
	bge _08084D34
	subs r0, r7, r2
_08084D34:
	muls r0, r1, r0
	adds r1, r0, #0
	muls r1, r5, r1
	asrs r0, r1, #0x14
	add r0, ip
	strh r0, [r6]
	adds r6, #4
	adds r4, r4, r3
	adds r2, #2
	cmp r2, #0x9f
	ble _08084D1C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084D58: .4byte 0x080DC15C

