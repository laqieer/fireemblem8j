	.syntax unified
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_8018CD4, "ax", %progbits
@ sub_8018CD4 @ JP 0x08018CD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018CD4
	.thumb_func
sub_8018CD4:
	push {r4, r5, lr}
	movs r4, #0x41
	ldr r5, _08018D00 @ =0x085C2A50
_08018CDA:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018CF4
	ldr r0, [r1]
	cmp r0, #0
	beq _08018CF4
	adds r0, r1, #0
	bl sub_801759C
_08018CF4:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018CDA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018D00: .4byte 0x085C2A50

