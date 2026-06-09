	.syntax unified
	.section .text.sub_8084DB4, "ax", %progbits
@ sub_8084DB4 @ JP 0x08084DB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8084DB4
	.thumb_func
sub_8084DB4:
	push {lr}
	ldr r0, _08084DCC @ =0x04000006
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r1, #0x9f
	bls _08084DD8
	ldr r0, _08084DD0 @ =0x0203E758
	ldr r1, _08084DD4 @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #0
	b _08084DDE
	.align 2, 0
_08084DCC: .4byte 0x04000006
_08084DD0: .4byte 0x0203E758
_08084DD4: .4byte 0x0203E750
_08084DD8:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08084DDE:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08084E00
	ldr r2, _08084E04 @ =0x04000014
	ldr r0, _08084E08 @ =0x0203E758
	ldr r0, [r0]
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r3, #0xa0
	lsls r3, r3, #1
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1]
	strh r0, [r2]
_08084E00:
	pop {r0}
	bx r0
	.align 2, 0
_08084E04: .4byte 0x04000014
_08084E08: .4byte 0x0203E758

