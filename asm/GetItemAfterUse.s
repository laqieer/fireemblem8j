	.syntax unified
	.section .text.GetItemAfterUse, "ax", %progbits
@ GetItemAfterUse @ JP 0x08016894 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemAfterUse
	.thumb_func
GetItemAfterUse:
	push {lr}
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080168C0 @ =0x0885E068
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080168B8
	ldr r0, _080168C4 @ =0xFFFFFF00
	adds r2, r2, r0
	cmp r2, #0xff
	ble _080168C8
_080168B8:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	b _080168CA
	.align 2, 0
_080168C0: .4byte 0x0885E068
_080168C4: .4byte 0xFFFFFF00
_080168C8:
	movs r0, #0
_080168CA:
	pop {r1}
	bx r1
	.align 2, 0

