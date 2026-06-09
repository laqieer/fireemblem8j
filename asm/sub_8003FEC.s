	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_8003FEC, "ax", %progbits
@ sub_8003FEC @ JP 0x08003FEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003FEC
	.thumb_func
sub_8003FEC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _08004008
	ldr r1, _08004004 @ =0x080DC3F0
	bl sub_80040B8
	ldrb r0, [r4, #2]
	adds r0, #8
	b _0800406C
	.align 2, 0
_08004004: .4byte 0x080DC3F0
_08004008:
	movs r6, #1
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r7, [r4, #2]
	cmp r0, #0
	beq _08004024
_08004018:
	adds r6, #1
	movs r1, #0xa
	bl __divsi3
	cmp r0, #0
	bne _08004018
_08004024:
	subs r0, r6, #1
	lsls r0, r0, #3
	adds r0, r7, r0
	strb r0, [r4, #2]
	lsls r7, r6, #3
	cmp r6, #0
	ble _08004064
_08004032:
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #0x18
	ldr r1, _08004078 @ =0x4F820000
	adds r0, r0, r1
	asrs r0, r0, #0x10
	mov r1, sp
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	mov r1, sp
	bl sub_80040B8
	ldrb r0, [r4, #2]
	subs r0, #0x10
	strb r0, [r4, #2]
	subs r6, #1
	cmp r6, #0
	bne _08004032
_08004064:
	adds r0, r7, #0
	adds r0, #8
	ldrb r1, [r4, #2]
	adds r0, r0, r1
_0800406C:
	strb r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004078: .4byte 0x4F820000

