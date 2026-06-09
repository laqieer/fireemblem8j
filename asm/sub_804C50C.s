	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804A070, 0x0804A070 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_804C50C, "ax", %progbits
@ sub_804C50C @ JP 0x0804C50C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C50C
	.thumb_func
sub_804C50C:
	push {r4, lr}
	adds r4, r0, #0
_0804C510:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble _0804C522
	bl sub_808B2A4
	adds r0, r4, #0
	bl sub_8002DE4
	b _0804C57A
_0804C522:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804C548 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804C540
	ldr r0, [r2]
	cmp r0, #0
	bne _0804C54C
_0804C540:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b _0804C510
	.align 2, 0
_0804C548: .4byte 0x00010004
_0804C54C:
	ldr r3, _0804C580 @ =0x0203DD8C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_804A070
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
_0804C57A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C580: .4byte 0x0203DD8C

