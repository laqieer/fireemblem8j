	.syntax unified
	.set AddAndDrawGmPath, 0x080C4370 + 1
	.section .text.sub_800C410, "ax", %progbits
@ sub_800C410 @ JP 0x0800C410 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C410
	.thumb_func
sub_800C410:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C42E
	adds r0, r2, #0
	movs r1, #0x1e
	bl AddAndDrawGmPath
	movs r0, #2
	b _0800C438
_0800C42E:
	adds r0, r2, #0
	movs r1, #0
	bl AddAndDrawGmPath
	movs r0, #0
_0800C438:
	pop {r1}
	bx r1

