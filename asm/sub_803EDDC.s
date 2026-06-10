	.syntax unified
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_803DAF0, 0x0803DAF0 + 1
	.section .text.sub_803EDDC, "ax", %progbits
@ sub_803EDDC @ JP 0x0803EDDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EDDC
	.thumb_func
sub_803EDDC:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, _0803EE30 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803EE2C
	ldr r4, _0803EE34 @ =0x0202E4DC
	ldr r0, [r4]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl sub_80194BC
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	movs r1, #0
	strb r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #0x78
	bl MapAddInRange
	bl sub_803DAF0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r5
	bne _0803EE38
_0803EE2C:
	movs r0, #0
	b _0803EE3A
	.align 2, 0
_0803EE30: .4byte 0x03004DF0
_0803EE34: .4byte 0x0202E4DC
_0803EE38:
	movs r0, #1
_0803EE3A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

