	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C476C, "ax", %progbits
@ sub_80C476C @ JP 0x080C476C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C476C
	.thumb_func
sub_80C476C:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bgt _080C47F4
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _080C4792
	cmp r0, #1
	beq _080C479C
	adds r1, #1
	b _080C47A6
_080C4792:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	b _080C47A4
_080C479C:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #2
_080C47A4:
	strb r0, [r1]
_080C47A6:
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _080C47CA
	adds r1, r0, #0
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080C47F4
_080C47CA:
	ldr r0, _080C47FC @ =0x08AC1108
	bl Proc_Find
	ldr r3, [r0, #0x48]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r2, [r0]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	adds r3, #0x34
	adds r3, r3, r0
	movs r0, #0x1f
	ands r2, r0
	movs r1, #1
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
	adds r0, r4, #0
	bl sub_8002DE4
_080C47F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C47FC: .4byte 0x08AC1108

