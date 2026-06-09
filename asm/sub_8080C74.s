	.syntax unified
	.set UpdateMapAnimScanline, 0x08084264 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_8080C74, "ax", %progbits
@ sub_8080C74 @ JP 0x08080C74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080C74
	.thumb_func
sub_8080C74:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x48
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #5
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r2, r0, #0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl UpdateMapAnimScanline
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1d
	ble _08080CAE
	adds r0, r5, #0
	bl sub_8002DE4
_08080CAE:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

