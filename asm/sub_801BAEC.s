	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetWeather, 0x08030BCC + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_801BA6C, 0x0801BA6C + 1
	.section .text.sub_801BAEC, "ax", %progbits
@ DebugMenu_WeatherIdle @ JP 0x0801BAEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DebugMenu_WeatherIdle
	.thumb_func
DebugMenu_WeatherIdle:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _0801BB2C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	cmp r0, #0
	beq _0801BB8A
	ldr r0, _0801BB30 @ =0x085C2EDC
	bl Proc_Find
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_801BA6C
	ldr r0, [r4, #0x58]
	movs r1, #7
	bl __modsi3
	cmp r0, #6
	bhi _0801BB8A
	lsls r0, r0, #2
	ldr r1, _0801BB34 @ =_0801BB38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BB2C: .4byte 0x085775CC
_0801BB30: .4byte 0x085C2EDC
_0801BB34: .4byte _0801BB38
_0801BB38: @ jump table
	.4byte _0801BB54 @ case 0
	.4byte _0801BB5C @ case 1
	.4byte _0801BB64 @ case 2
	.4byte _0801BB6C @ case 3
	.4byte _0801BB74 @ case 4
	.4byte _0801BB7C @ case 5
	.4byte _0801BB84 @ case 6
_0801BB54:
	movs r0, #0
	bl SetWeather
	b _0801BB8A
_0801BB5C:
	movs r0, #6
	bl SetWeather
	b _0801BB8A
_0801BB64:
	movs r0, #1
	bl SetWeather
	b _0801BB8A
_0801BB6C:
	movs r0, #2
	bl SetWeather
	b _0801BB8A
_0801BB74:
	movs r0, #4
	bl SetWeather
	b _0801BB8A
_0801BB7C:
	movs r0, #3
	bl SetWeather
	b _0801BB8A
_0801BB84:
	movs r0, #5
	bl SetWeather
_0801BB8A:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

