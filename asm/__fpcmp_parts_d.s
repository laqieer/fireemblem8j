	.syntax unified
	.section .text.__fpcmp_parts_d, "ax", %progbits
@ __fpcmp_parts_d @ JP 0x080DB2C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __fpcmp_parts_d
	.thumb_func
__fpcmp_parts_d:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _080DB2D4
	movs r0, #1
_080DB2D4:
	cmp r0, #0
	bne _080DB2E6
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _080DB2E2
	movs r0, #1
_080DB2E2:
	cmp r0, #0
	beq _080DB2EA
_080DB2E6:
	movs r0, #1
	b _080DB3C0
_080DB2EA:
	movs r0, #0
	cmp r1, #4
	bne _080DB2F2
	movs r0, #1
_080DB2F2:
	cmp r0, #0
	beq _080DB30A
	movs r0, #0
	cmp r2, #4
	bne _080DB2FE
	movs r0, #1
_080DB2FE:
	cmp r0, #0
	beq _080DB30A
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _080DB3C0
_080DB30A:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _080DB314
	movs r1, #1
_080DB314:
	cmp r1, #0
	bne _080DB362
	movs r1, #0
	cmp r2, #4
	bne _080DB320
	movs r1, #1
_080DB320:
	cmp r1, #0
	beq _080DB332
_080DB324:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _080DB36C
	movs r1, #1
	b _080DB36C
_080DB332:
	movs r1, #0
	cmp r0, #2
	bne _080DB33A
	movs r1, #1
_080DB33A:
	cmp r1, #0
	beq _080DB34A
	movs r1, #0
	cmp r2, #2
	bne _080DB346
	movs r1, #1
_080DB346:
	cmp r1, #0
	bne _080DB3BE
_080DB34A:
	movs r1, #0
	cmp r0, #2
	bne _080DB352
	movs r1, #1
_080DB352:
	cmp r1, #0
	bne _080DB324
	movs r0, #0
	cmp r2, #2
	bne _080DB35E
	movs r0, #1
_080DB35E:
	cmp r0, #0
	beq _080DB370
_080DB362:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _080DB36C
	subs r1, #2
_080DB36C:
	adds r0, r1, #0
	b _080DB3C0
_080DB370:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _080DB382
_080DB378:
	movs r0, #1
	cmp r4, #0
	beq _080DB3C0
	subs r0, #2
	b _080DB3C0
_080DB382:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _080DB378
	cmp r1, r0
	bge _080DB39A
_080DB38E:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _080DB3C0
	movs r0, #1
	b _080DB3C0
_080DB39A:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _080DB378
	cmp r3, r2
	bne _080DB3AE
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _080DB378
_080DB3AE:
	cmp r2, r3
	bhi _080DB38E
	cmp r2, r3
	bne _080DB3BE
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _080DB38E
_080DB3BE:
	movs r0, #0
_080DB3C0:
	pop {r4, r5, r6, pc}
	.align 2, 0

