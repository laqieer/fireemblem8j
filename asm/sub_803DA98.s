	.syntax unified
	.section .text.sub_803DA98, "ax", %progbits
@ sub_803DA98 @ JP 0x0803DA98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803DA98
	.thumb_func
sub_803DA98:
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803DAD0 @ =0x0202E4DC
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803DACC
	ldr r0, _0803DAD4 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803DADC
	ldr r0, _0803DAD8 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803DADC
_0803DACC:
	movs r0, #0xff
	b _0803DAE8
	.align 2, 0
_0803DAD0: .4byte 0x0202E4DC
_0803DAD4: .4byte 0x0202E4D4
_0803DAD8: .4byte 0x0202BE40
_0803DADC:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803DAE8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

