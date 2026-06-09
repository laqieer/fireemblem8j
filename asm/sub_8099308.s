	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8099308, "ax", %progbits
@ sub_8099308 @ JP 0x08099308 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099308
	.thumb_func
sub_8099308:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r0, _08099358 @ =0x08A94430
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _0809939C
	movs r4, #0
	movs r0, #0x38
	adds r0, r0, r1
	mov sl, r0
	mov r3, sl
_08099330:
	ldr r2, [r3]
	cmp r2, #0
	beq _0809935C
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r6
	bne _0809935C
	str r7, [r2, #0x2c]
	adds r0, r2, #0
	adds r0, #0x38
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r3]
	mov r2, sb
	str r2, [r0, #0x34]
	ldr r1, [sp, #0x20]
	str r1, [r0, #0x30]
	b _0809939C
	.align 2, 0
_08099358: .4byte 0x08A94430
_0809935C:
	adds r3, #4
	adds r4, #1
	cmp r4, #7
	ble _08099330
	adds r5, r1, #0
	adds r5, #0x2b
	ldrb r4, [r5]
	ldr r0, _080993AC @ =0x08A94420
	bl sub_8002BCC
	lsls r1, r4, #2
	add r1, sl
	str r0, [r1]
	adds r0, #0x39
	strb r6, [r0]
	ldr r0, [r1]
	str r7, [r0, #0x2c]
	adds r0, #0x38
	mov r2, r8
	strb r2, [r0]
	ldr r0, [r1]
	mov r1, sb
	str r1, [r0, #0x34]
	ldr r2, [sp, #0x20]
	str r2, [r0, #0x30]
	adds r0, #0x3c
	movs r1, #7
	bl InitText
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_0809939C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080993AC: .4byte 0x08A94420

