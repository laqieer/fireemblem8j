	.syntax unified
	.section .text.sub_803AE5C, "ax", %progbits
@ sub_803AE5C @ JP 0x0803AE5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803AE5C
	.thumb_func
sub_803AE5C:
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803AE94 @ =0x0202E4E0
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803AE90
	ldr r0, _0803AE98 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803AEA0
	ldr r0, _0803AE9C @ =0x0202BE40
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803AEA0
_0803AE90:
	movs r0, #0xff
	b _0803AEAC
	.align 2, 0
_0803AE94: .4byte 0x0202E4E0
_0803AE98: .4byte 0x0202E4D4
_0803AE9C: .4byte 0x0202BE40
_0803AEA0:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803AEAC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

