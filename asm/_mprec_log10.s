	.syntax unified
	.set sub_80DAE94, 0x080DAE94 + 1
	.section .text._mprec_log10, "ax", %progbits
@ _mprec_log10 @ JP 0x080DA1F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _mprec_log10
	.thumb_func
_mprec_log10:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080DA214 @ =0x00000000
	ldr r0, _080DA210 @ =0x3FF00000
	cmp r4, #0x17
	bgt _080DA21C
	ldr r0, _080DA218 @ =0x0857748C
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	b _080DA22E
	.align 2, 0
_080DA210: .4byte 0x3FF00000
_080DA214: .4byte 0x00000000
_080DA218: .4byte 0x0857748C
_080DA21C:
	cmp r4, #0
	ble _080DA22E
_080DA220:
	ldr r3, _080DA234 @ =0x00000000
	ldr r2, _080DA230 @ =0x40240000
	bl sub_80DAE94
	subs r4, #1
	cmp r4, #0
	bgt _080DA220
_080DA22E:
	pop {r4, pc}
	.align 2, 0
_080DA230: .4byte 0x40240000
_080DA234: .4byte 0x00000000

