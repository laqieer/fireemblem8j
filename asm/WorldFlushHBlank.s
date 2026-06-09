	.syntax unified
	.section .text.WorldFlushHBlank, "ax", %progbits
@ WorldFlushHBlank @ JP 0x08084B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WorldFlushHBlank
	.thumb_func
WorldFlushHBlank:
	push {lr}
	ldr r0, _08084BB4 @ =0x04000006
	ldrh r0, [r0]
	adds r3, r0, #0
	cmp r3, #0x9e
	bls _08084BC0
	ldr r0, _08084BB8 @ =0x0203E758
	ldr r1, _08084BBC @ =0x0203E750
	ldr r1, [r1]
	str r1, [r0]
	movs r3, #0
	b _08084BC6
	.align 2, 0
_08084BB4: .4byte 0x04000006
_08084BB8: .4byte 0x0203E758
_08084BBC: .4byte 0x0203E750
_08084BC0:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08084BC6:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _08084BDC
	ldr r2, _08084BE0 @ =0x04000040
	ldr r0, _08084BE4 @ =0x0203E758
	ldr r1, [r0]
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_08084BDC:
	pop {r0}
	bx r0
	.align 2, 0
_08084BE0: .4byte 0x04000040
_08084BE4: .4byte 0x0203E758

