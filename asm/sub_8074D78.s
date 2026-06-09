	.syntax unified
	.set CheckBanimHensei, 0x08078730 + 1
	.set MakeBgmOverridePersist, 0x0800265C + 1
	.set sub_80025C0, 0x080025C0 + 1
	.section .text.sub_8074D78, "ax", %progbits
@ sub_8074D78 @ JP 0x08074D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074D78
	.thumb_func
sub_8074D78:
	push {lr}
	bl CheckBanimHensei
	cmp r0, #1
	beq _08074D96
	ldr r0, _08074D9C @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08074D96
	ldr r0, _08074DA0 @ =0x020200A8
	ldr r0, [r0]
	cmp r0, #0
	bne _08074DA4
_08074D96:
	bl MakeBgmOverridePersist
	b _08074DA8
	.align 2, 0
_08074D9C: .4byte 0x0202BCAC
_08074DA0: .4byte 0x020200A8
_08074DA4:
	bl sub_80025C0
_08074DA8:
	pop {r0}
	bx r0

